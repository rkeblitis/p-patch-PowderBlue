class NewsMailer < ActionMailer::Base
  default from: "rkeblitis@gmail.com"

  def mail
    @news = Post.last
    #User.all.each do |user|
      mail(to: "rkeblitis@gmail.com",
          subject: "Moar News for ",
          body: "#{@news.title}\n read more: \n http://localhost:3000/posts/#{@news.id}"
          )
    #end
  end



end
