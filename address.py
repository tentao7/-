class Contact:
    def __init__ (self,nameP,phone_numberP,e_mailP,addrP):
        self.name = nameP
        self.phone_number= phone_numberP
        self.email = e_mailP
        self.addr = addrP
        
    def print_info(self):
        print('Name:',self.name)
        print('Phone Number:',self.phone_number)
        print('E-mail:',self.email)
        print('Address:',self.addr)
        
        
        
## 연락처 입력 함수 만들기
def set_contact():
    name = input ('Name:')
    phone_number = input ('Phone_Number:')       
    email = input ('email:')
    addr = input('addr:')    
    
    #주소록 생성 
    contact= Contact(name,phone_number,email,addr)
    return contact

        
def print_menu():
    print('1. 연락처 입력:')
    print('2. 연락처 출력:')
    print('3. 연락처 삭제:')
    print('4. 종료')
    menu = input ('메뉴선택:')
    return int(menu)

def print_contact(ListA):
    for items in ListA :
        items.print_info()

def delete_contact(ListA,name):
    for i,items in enumerate(ListA):   #연락처 삭제 
       if items.name == name: 
           del ListA[i]


def store_contact(ListA):
    f=open('contact_db.txt','wt')
    #주소록 리스트의 목록(name, phon number, email,address)
    
    for items in ListA: 
        f.write(items.name+'\n')
        f.write(items.phone_number+'\n')
        f.write(items.email + '\n')
        f.write(items.addr +'\n')
    f.close()


def run():
    
    allList =[] #빈 리스트
 # 연락처 불러 오기 
   
    
    while True:
        menu = print_menu()
        print('우리가 선택한 메뉴:', menu)
        
        
        if menu ==1:
            print('연락처 입력을 선택 했다')
            NewContact = set_contact()
            # NewContact.print_info() = set_contact()
            allList.append(NewContact) # 하나의 주소록 추
            
        elif menu ==2:
            print('연락처 출력을 선택 했다')
          
            print_contact(allList)
        elif menu ==3:
            print('연락처 삭제를 선택 했다')
            ## delete list value object=address
            name = input('삭제할 이름은?:')
            delete_contact(allList,name)
            
            
        elif menu ==4:
            print('연락처 삭제을 선택 했다')
            store_contact(allList) # 파일 쓰기 함수 
            break
            
        
#def run():
   #myContact = Contact('홍길동', '0101-2333-545','kkk@naver.com','Seoul')
   #myFriend = Contact('홍길동', '0101-2333-545','kkk@naver.com','Seoul')
   #myFriend = Contact('legend','012-0123-3355', 'kky@naver.com','Busan')
   #myContact.print_info()


if __name__ =='__main__':
    run()
   
    
        
        