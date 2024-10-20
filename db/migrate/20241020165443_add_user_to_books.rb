class AddUserToBooks < ActiveRecord::Migration[7.0]
  def change
    # 找到管理员用户
    admin = User.find_by(email: 'ceciliachen721@gmail.com')
    
    # 添加 user_id 字段，允许为 null
    add_reference :books, :user, foreign_key: true, null: true

    # 将已有的书籍都关联到管理员
    Book.where(user_id: nil).update_all(user_id: admin.id)

    # 将 user_id 设置为不允许为空
    change_column_null :books, :user_id, false
  end
end
