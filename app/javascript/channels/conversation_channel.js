import consumer from "./consumer";

document.addEventListener('turbo:load', () => {
  setupMessageChannel();
  setupMessageForm();
});

function setupMessageChannel() {
  const messagesContainer = document.getElementById('messages');
  const conversationId = document.getElementById('conversation-id')?.value;

  if (conversationId && messagesContainer) {
    consumer.subscriptions.create(
      {
        channel: "ConversationChannel",
        conversation_id: conversationId
      },
      {
        connected() {
          console.log("Connected to conversation channel:", conversationId);
        },
        disconnected() {
          console.log("Disconnected from conversation channel:", conversationId);
        },
        received(data) {
          if (data.html) {
            messagesContainer.insertAdjacentHTML('beforeend', data.html);
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
          }
        }
      }
    );
  }
}

function setupMessageForm() {
  const form = document.getElementById('message-form');
  
  if (!form) return;
  
  // 确保删除所有现有的事件监听器
  const newForm = form.cloneNode(true);
  form.parentNode.replaceChild(newForm, form);
  
  let isSubmitting = false;
  
  // 阻止表单的默认提交行为
  newForm.addEventListener('submit', handleSubmit);
  
  async function handleSubmit(e) {
    e.preventDefault();
    e.stopPropagation(); // 阻止事件冒泡
    
    if (isSubmitting) return;
    
    const textarea = newForm.querySelector('textarea[name="content"]');
    const submitButton = newForm.querySelector('input[type="submit"]');
    const content = textarea.value.trim();
    
    if (!content) {
      alert('メッセージを入力してください。');
      return;
    }
    
    try {
      isSubmitting = true;
      submitButton.disabled = true;
      submitButton.value = '送信中...';
      
      const response = await fetch(newForm.action, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content,
          'Accept': 'application/json'
        },
        body: JSON.stringify({ content })
      });

      if (response.ok) {
        const data = await response.json();
        if (data.status === 'duplicate') {
          // 处理重复提交的情况
          return;
        }
        newForm.reset();
      } else {
        const data = await response.json();
        console.error('Server error:', data);
        alert(data.errors?.join('\n') || 'メッセージの送信に失敗しました。');
      }
    } catch (error) {
      console.error('Network error:', error);
      alert('通信エラーが発生しました。');
    } finally {
      isSubmitting = false;
      submitButton.disabled = false;
      submitButton.value = '送信';
    }
  }
}