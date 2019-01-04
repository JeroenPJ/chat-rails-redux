Message.destroy_all
User.destroy_all
Channel.destroy_all

channels = %w[general amsterdam lisbon].map { |n| { name: n } }
Channel.create(channels)

users = [
  {
    email: "myron@tsakirakis.me",
    password: "myron"
  },
  {
    email: "jeroen@ja.gt",
    password: "jeroen"
  },
]

myron, jeroen = User.create(users)

def cm(user, channelname, content)
  Message.create(user: user, channel: Channel.find_by_name(channelname), content: content)
end

cm(myron, "lisbon", "i am here!")
cm(jeroen, "lisbon", "me as well")

cm(jeroen, "amsterdam", "i spent christmas here")

cm(jeroen, "general", "hi everyone")
cm(myron, "general", "hello. jj is best in csgo")
