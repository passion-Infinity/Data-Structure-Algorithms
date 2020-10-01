My feeling after doing LAB1
======
### Hello teacher, I am really happy with your exercises :)). I think I could improve a little bit my skills through it. You know, The first time, you came my class, you talked a lot of thing, but I couldn't understand them. For example, CLI or build file java to file jar :)). Yes really, I felt maybe I couldn't overcome this course. :)). I also learnt and enjoyed Information technology nearly when I go to university. All previous time, I don't know more about technologies. So, I really hope, I can learn more things from you(help me).
   ### Through your exercise, I had some problems
Likewise, I talked behind that, I don't know CLI, so I lost a lot of time for it. Maybe now, I can understand. Firstly, talk about exercise 1. I don't have trouble with it. But my code is still awkward, How can I improve it? Second, When you lead us do exercise, I hope you can give an detail example. I can base it to understand easily. Because, all matters you talk almost I didn't know before. Maybe I knew, but I can learn agian or understand other ways. Thirdly, I think I am really lucky when I am in your class. Because you are a professional dev, you have experience in job, you know what are improtant things for job and you teach them for us that I didn't learn from previous courses like Using git,.. Finally, I also lost more time for exercise 2. Because, some problems in it. For example, I can do exactly with URL of 24h.com.vn :)), but I think I can fix it in the future. Because I have to spend for other courses :)). I hope I can learn more from you. That all my ideas. I will learn python:))
Thanks for reading. 

LAB1_Bai1
======
1. Create class DoublyLinkedList, I remake it from book, and add some nesscessary methods like: 
   removeAtPos: delete Node at any position
   get: return data of node at specific position
2. Create class player to do data for data of doublyLinkedList, It consists 2 arrtributes and some methods:
   Attributes: String email and long point
   and Getter, setter of those attributes.
3. Create class PriorityQueue to save methods add, update, get, remove.
### I had issues in this class. 
   Firstly, I lost much time for addAndSortMethod, because I forgot one case in loop while. So result when I add a new Player without the same point with existing player in list, it located before player given in list. But now I found trouble and fixed completely.
   Second, I also got some problems in update method. Becasue I forgot updating point of player when I updated. But I found my mistake and fixed it.
   Thirdly, I had some matters with CLI of Bai1. My ideas with this CLI is using switch case instead of using many if instructions. And I did it greatly to follow my thoungts.
### Maybe those are all problems, I have difficulties to solve in Bai1.

LAB1_Bai2
======
In my opinion, I felt it difficult than Bai1. I don't know where is my errors if i base on your testcase. Because When I check it on web, It is different with your testcase. 
   I only have difficulties to method processHTML. I do it again many times. If you don't require to use stack to report, I think maybe it will be easy than. Because I only use hashmap or hashtable to count and save. But I have to follow your require.
   ### My ideas to solve it:
     ### I will seperate my process method into two branches.
   Firstly, I will check opening tags. It will have: normal tag, special tag and some tag startswith "!".
       - If tag located in tag startswith "!", I will reject this tag and continute my loop to check.
       - If tag is special tag like <br/> I will put it on my hashmap and count it.
       - Else if tag is normal tag, I will push it into my arrayStack. And When I pop tag from stack, I will check if it have closing tag and it is the same name tag i will put it on my hashmap and count.
   ### This is my idea to solve this problem.
  
  Bai2 consists interface stack, arrayStack class implement stack, and one class to manage some methods: loadURL, WriteToFile, and processHTML. 
  - LoadURL: get content HTML from website, It will return a String.
  - WriteToFIle: list all name tag HTML appear in Web and frequency of them. 
  - processHTML: count tag, sort frequency of tag following descending list. 
  
   
   
    
   

