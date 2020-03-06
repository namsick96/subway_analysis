library(ggplot2,ggmap)
library(data.table)
setwd("/Users/jihoonan/Desktop/subway")
subway=read.csv("subway.csv",header=T,stringsAsFactors = FALSE,fileEncoding = "euc-kr")
str(subway)
subway.new1=subset(subway,subway$호선명=="1호선")
subway.new2= subset(subway,subway$호선명=="2호선")
subway.new3= subset(subway,subway$호선명=="3호선")
subway.new4= subset(subway,subway$호선명=="4호선")
subway.new5= subset(subway,subway$호선명=="5호선")
subway.new6= subset(subway,subway$호선명=="6호선")
subway.new7= subset(subway,subway$호선명=="7호선")
subway.new8= subset(subway,subway$호선명=="8호선")
#c("1호선","2호선","3호선","4호선","5호선","6호선"))
data=list(subway.new1,subway.new2,subway.new3,subway.new4,subway.new5,subway.new6,
          subway.new7,subway.new8)# 리스트로 묶기

subway.new=rbindlist(data) #1~8호선 중심으로 데이터 정리 완료

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
#데이터 타입 확인, 변경 완료
names(subway.new)[3]="역명" #컬럼 이름 통일화
names(subway.new)[2]="호선"
View(subway.new)
View(head(subway_add))
subway.new$호선=as.integer(subway.new$호선)# 형태 char에서 int 로 변환
class(subway.new[2,2])
class(subway.new$호선) #타입변환완료
class(subway_add$호선)
subway_final=merge(subway.new,subway_add,by=c("호선","역명"),all.x=T) 
                   #기준col(호선,역명) 중심으로 merge
class(subway_final)
View((subway_final))
write.csv(subway_final,file="subway_file_merge.csv",row.names = F) #save final
#data cleansing end
#subway_final_merge is final processed data
