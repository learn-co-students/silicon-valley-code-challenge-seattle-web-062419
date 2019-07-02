require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
aaa=Startup.new("aaa","stef","d1")
bbb=Startup.new("bbb","grace","d2")
ccc=Startup.new("ccc","eric","d3")
ddd=Startup.new("ddd","stef","d4")

cap1=VentureCapitalist.new("cap1",60)
cap2=VentureCapitalist.new("cap2",70)
cap3=VentureCapitalist.new("cap3",80)
cap4=VentureCapitalist.new("cap4",90)
cap5=VentureCapitalist.new("cap5",120)
cap6=VentureCapitalist.new("cap6",130)

fund1=FundingRound.new(aaa,cap1,"t1",20.5)
fund2=FundingRound.new(bbb,cap1,"t2",30.5)
fund3=FundingRound.new(aaa,cap3,"t3",40.5)
fund4=FundingRound.new(ccc,cap4,"t1",50.5)
fund5=FundingRound.new(ccc,cap5,"t2",60.5)
fund6=FundingRound.new(ddd,cap6,"t1",30.5)
fund7=FundingRound.new(ddd,cap6,"t3",40.5)


# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line