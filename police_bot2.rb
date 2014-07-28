require 'cinch'
IRC_ENCODING='utf-8'
BOT_ENCODING='utf-8'

bot = Cinch::Bot.new do
	configure do |c|
		c.server   = "thermal.rgk.ricoh.co.jp"
		c.port     = "6668"
		c.nick     = "police"
		c.channels = ["#v-rev","#ape-cloud","#vr-test","#ape-tech","#ape-release","#ape-shinkei","#ape-drill", "#ape-pc","#ape-devsite","#test"]
	end
	on :message, /(paty|patu|pati|steve|石橋|ぱてぃ|なおき|ぱちぃ|hiroyuki|ひろゆき|ogawa|watti|hotta)/ do |m, text|
#	on :message, /(paty|patu)/ do |m, text|
		User("yosi_dev").send "【#{m.channel}】 #{m.user.nick} >>> #{text} > yosi".encode(IRC_ENCODING).force_encoding(BOT_ENCODING)
		User("yosi_note").send "【#{m.channel}】 #{m.user.nick} >>> #{text} > yosi".encode(IRC_ENCODING).force_encoding(BOT_ENCODING)
	end
end

bot.start 

