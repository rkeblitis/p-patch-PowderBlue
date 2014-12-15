class NewsMailer < ActionMailer::Base
  default from: "rkeblitis@gmail.com"
  # def join_us
  #   @news = Post.first
  #   mail(to: "bookis.smuin+club@gmail.com", subject: "Come join #{@news.title} for a dance party!")
  # end


  def news_update(post_id)
    @news = Post.find(post_id)
    User.all.each do |user|
      mail(to: user.email,
          subject: "Moar News for ",
          body: "#{@news.title}\n read more: \n http://localhost:3000/posts/#{@news.id}"
          )
    end
    Resque.enqueue(EmailJob, @news)
  end
  #


end
