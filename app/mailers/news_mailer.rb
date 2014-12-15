class NewsMailer < ActionMailer::Base
  default from: "rkeblitis@gmail.com"
  # def join_us
  #   @news = Post.first
  #   mail(to: "bookis.smuin+club@gmail.com", subject: "Come join #{@news.title} for a dance party!")
  # end

  def news_update
    @news = Post.last
    #User.all.each do |user|
      mail(to: "rkeblitis@gmail.com",
          subject: "Moar News for ",
          body: "#{@news.title}\n read more: \n http://localhost:3000/posts/#{@news.id}"
          )
    #end
  end
  #


end
