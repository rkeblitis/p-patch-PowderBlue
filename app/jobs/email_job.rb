class EmailJob
  @queue = :email
  
  def self.perform
    NewsMailer.news_update(post_id).deliver
  end
end
