library(ggplot2,ggmap)
setwd("/Users/jihoonan/Desktop/subway")
subway=read.csv("subway.csv",header=T,stringsAsFactors = FALSE,fileEncoding = "euc-kr")
str(subway)
subway.new1=subset(subway,subway$호선명==c("1호선","2호선","3호선","4호선","5호선","6호선"))
table(subway.new1$호선명)
subway.new2=subset(subway,subway$호선명==c("7호선","8호선"))
subway.new=rbind(subway.new1,subway.new2) #1~8호선 중심으로 데이터 정리 완료

subway_add=read.csv("subwaystationadd.csv",header=T,stringsAsFactors = FALSE,
                    fileEncoding = "euc-kr") #파일 불러오기
subway.new$호선명#데이터 타입 확인
class(subway_add$호선[1]) # 데이터 타입 확인

for( i in 1:nrow(subway.new)){
  if(subway.new$호선명[i]=="1호선"){
    subway.new$호선명[i]=1
  }
  if(subway.new$호선명[i]=="2호선"){
    subway.new$호선명[i]=2
  }
  if(subway.new$호선명[i]=="3호선"){
    subway.new$호선명[i]=3
  }
  if(subway.new$호선명[i]=="4호선"){
    subway.new$호선명[i]=4
  }
  if(subway.new$호선명[i]=="5호선"){
    subway.new$호선명[i]=5
  }
  if(subway.new$호선명[i]=="6호선"){
    subway.new$호선명[i]=6
  }
  if(subway.new$호선명[i]=="7호선"){
    subway.new$호선명[i]=7
  }
  if(subway.new$호선명[i]=="8호선"){
    subway.new$호선명[i]=8
  }
}
subway.new$호선명#데이터 타입 확인, 변경 완료

subway_final=merge(subway.new,subway_add,by.x=c("호선명","지하철역"),
                   by.y=c("호선","역명"),) #기준col 중심으로 merge
save(subway_final,file="subway_file_merge") #save final
