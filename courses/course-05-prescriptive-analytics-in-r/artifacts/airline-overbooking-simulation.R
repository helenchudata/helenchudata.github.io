#Inputs
Fare<-200
Seats<-132
Refund<-0.5
BumpCost<-2.5
NSRate<-.1
Tickets<-150

#Simple Model - using expected outcomes
NoShows<-Tickets*NSRate
Arrivals<-Tickets-NoShows
Bumps<-max(0,Tickets-NoShows-Seats)
Profit<-Tickets*Fare-NoShows*Fare*Refund-Bumps*Fare*BumpCost
Profit

#
replications<-1000
NoShows<-rbinom(replications,Tickets,NSRate)


#sketch of model
Profit<-c()
#for(i in 0:reasonable upper limit){
  #set.seed(123)
  #Tickets sold (seats + i)
  #NoShow vector using rbinom
  #Arrivals Tickets- NoShows
  #Bumps either 0 or Tickets minus NoShows minsus Seats (if positive)
      #use pmax to simplify this step i.e. pmax(0, calculated bumps) 
      #as pmax will work on the entire vector on noshows
  #Profit  equals Tickets*Fare-NoShows*Fare*Refund-Bumps*Fare*BumpCost)
  #use cbind() to construct a array of profits for each OB level i
#}

set.seed(123)
TicketsSold<-Seats #For i=0 (no overbooking)
NoShows<-rbinom(replications,TicketsSold,NSRate)
Arrivals<-TicketsSold-NoShows
Bumps<-pmax(0,Arrivals-Seats) #Only positive values, otherwise 0
ProfitArray<-TicketsSold*Fare-NoShows*Fare*Refund-Bumps*Fare*BumpCost

#Loop for overbooking levels i=1 to 20
for(i in 1:20){
  set.seed(123)
  TicketsSold<- Seats + i
  NoShows<-rbinom(replications,TicketsSold,NSRate)
  Arrivals<-TicketsSold-NoShows
  Bumps<-pmax(0,Arrivals-Seats)
  Profit<-TicketsSold*Fare-NoShows*Fare*Refund-Bumps*Fare*BumpCost
  ProfitArray<-cbind(ProfitArray,Profit)
}
summary(ProfitArray)

#plot the means (over the replications) using colMeans()
MeanProfit<-colMeans(ProfitArray) #Compute the mean profit for each overbooking level
plot(MeanProfit)

