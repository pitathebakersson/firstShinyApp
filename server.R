library(UsingR)
library(ggplot2)
data(CO2)

shinyServer(
  
  function(input, output){
    
    output$newHist <- renderPlot({

      co2uptake <- CO2[which(CO2$conc>input$conc_thresh),]
      
      hist(co2uptake$uptake, xlab="CO2 Uptake",col='lightblue',main='Histogram')
      mu <- input$mu
      # output$text1 <- renderText({input$text1})
      
      lines(c(mu,mu),c(0,200),col="red",lwd=2)
      mse <- mean((CO2$uptake-mu)^2)
      #text(10, 10, paste("mu = ", mu))
      #text(10, 12, paste("MSE = ", round(mse, 2)))
      output$text1 <- renderText(mse)
      output$text2 <- renderText(mu)
       
    })
    
    output$ggplot <- renderPlot({
      
      co2uptake <- CO2[which(CO2$conc>input$conc_thresh),]
      
      hist(co2uptake$uptake, xlab="CO2 Uptake",col='lightblue',main='Histogram')
      mu <- input$mu
      conc <- input$conc_thresh
      
      linearmodel1 <- lm(CO2$conc~CO2$uptake, factor="Type")
      summary(linearmodel1)
      
      g1 = ggplot(CO2, aes(x=conc, y=uptake, colour=factor(Type)))
      g1 = g1 + geom_point(size=2, colour="Black")+geom_point()+geom_smooth()
      g1 = g1 + xlab("Concentration") + ylab("Uptake") + geom_abline(data=CO2,intercept=coef(linearmodel1)[1],slope=-coef(linearmodel1)[2],size=0.5)
      g1
      
      
    })
    
  }
  
  
)