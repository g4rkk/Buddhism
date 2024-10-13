document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.toggle-bookmark').forEach((button) => {
    button.addEventListener('click', function(event) {
      event.preventDefault();  // 防止页面刷新

      const bookId = this.dataset.bookId;  // 获取书籍ID
      const url = `/books/${bookId}/toggle_bookmark`;

      // 发送 AJAX 请求
      fetch(url, {
        method: 'POST',
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
      })
      .then(response => response.json())
      .then(data => {
        // 注释掉这部分动态创建的 Flash 消息
        /*
        const flashContainer = document.createElement('div');
        flashContainer.className = 'alert alert-success shadow-lg mb-4';
        flashContainer.innerHTML = `<div>${data.message}</div>`;
        
        document.body.prepend(flashContainer);
        
        setTimeout(() => {
          flashContainer.remove();
        }, 3000);
        */
      });
    });
  });
});
