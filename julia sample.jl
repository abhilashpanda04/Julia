#output statements
println("hello world")
print("hello world")
show("hello world")


#readline for input

readline()
#symbols to type symbols=\pie=π

x,y=20,5

x+y
x-y
x*y
x/y
x\y#inverse division
x^y
x%y

+(4,7)
-(5,4)

div(12,4)
fld(12,4)
cld(12,4)
rem(12,5)
mod(12,5)
lcm(12,5)
gcd(12,5)

sqrt(15)
cbrt(21)
log(100)
log10(x)

log(4,x)#1st is base and next is value
hypot(34,5)#hypoteneous

+(3+5-2^3/5)#multiple operation

a=17
typeof(a)#type checking
typeof(4.6)
typeof('H')
typeof("Hello world")
prevfloat(4.6)
nextfloat(4.6)

x=2
π
β=3.14

x²=x^2

#rational number
r=2//5
denominator(r)
numerator(r)

#vectorised Dot operations
[1,2,2,4,5].+5
[1,2,2,4,5].^5
[1,2,2,4,5]./5

#strings
str="Hello Julia"
typeof(str)
char='H'
typeof(char)


#julia indexing start from 1 and not from 0

str[1:end]
str[3:5]

reverse(str)
str[end:-1:1]

#getting the last 2ns part of the string

str[end-1]


a="hello Julia"
b="greetings"
string(a,",",b)

#string interpolation
"$a $b"
"1+3=$(1+3)"

name="abhi"
""
"My name is $name"

#lower and upper case string
uppercase(str)
lowercase(str)
titlecase(str)
length(str)
split(str,"l")
repeat(str,10)#REPEAT 10 TIME
str="where is julia"
contains(str,"julia")
SubString(str,1,5)

#Tuples

()
Tuple()
tp=(1,3,5,7,8,9)
typeof(tp)
tp[1]
tp[2]

tp1=(1,)
typeof(tp1)

#Named Tuple

ntp=(a=100,b=200,c=300,d=400)
typeof(ntp)
#How to acess name tuple

ntp[1]
ntp.a
ntp[:a]
getindex(ntp,2)
getindex(ntp,:a)

keys(ntp)
values(ntp)

collect(ntp)
collect(pairs(ntp))

dump(ntp)
fieldnames(typeof(ntp))


#Arrays
# 1d=vectpr
# 2d=matrix/table
# 3d=multidimensional

# create arrays
arr=[]
arr1=["Strings",1,2]
arr_int=Int64[1,2,3,4]

arr_float=Float64[1,2,3,4]
# array([])
# array{type}(dims)

oddnums=[3,5,7,9]
#info
eltype(oddnums)
ndims(oddnums)
size(oddnums)
length(oddnums)
typeof(oddnums)

#indexing


oddnums[end]
oddnums[1]
oddnums[1:3]
#creating range

range(1,stop=10)
1:10

collect(1:10)
collect(range(1,stop=10))
oddn=collect(start,step,stop)
oddn=collect(1:2:10)
even=collect(2:2:10)
union(oddn,even)
intersect(oddn,even)
setdiff(oddn,even)

#modifyig arrays
oddn
push!(oddn,2)

pushfirst!(oddn,4)
#deleting elemnt in array

pop!(oddn)
popfirst!(oddn)


oddn

finalvalue=append!(oddn,even)
sort(finalvalue)
finalvalue
sort!(finalvalue)


finalvalue

extrema(finalvalue)
maximum(finalvalue)
minimum(finalvalue)


# conditional statements

#while loop
i=1
while i<=10
    println(i)
    i+=1
end

let i=1
    while i<=10
    show(i)
    i+=1
    end
end


let i=1
    while true
        println("correct")
        if i>=6
            continue
        end
        i+=1
    end
end

#for loop

a,b=25,30

if a>25
    println("a is greater than 25")
elseif a==25
    println("a is equal to $a")
else
    println("a is less than 25")
end

# ternary operator

 a ? b :c #this states if a >25 write b or else write c

a > 25 ? "greater than 25" : "A is lesser than 25"


#Dictionary
# Dict()

d=Dict("A"=>1,"B"=>2,"C"=>3,"D"=>4,"E"=>5)

keys(d)

values(d)
#Accessing dictionary

d["A"]
d["B"]

#
getindex(d,"A")


# Dictionary are mutable

d["A"]=200
d["A"]

d
d2=Dict([("a",35),("b",45),("c",65),("d",75),("e",95)])
in(("b"=>40),d2)#checking whether its there on not

haskey(d,"E")#checking the key

merge(d,d2)
get(d,"B",0)#getting something from dictionary














#function

function f(x)
    x+=10
end

f(10)

g(a,b)=a+b

g(2,5)


function f(x)
    x+10
    x*10
end

f(10)

h=f

h(30)

function area(x::Int64)
    return x*2
end

area(20)
area(20.1)
function area(x::Float64)
    return x*2
end

area(20.1)

area(20)

methods(area)


function tri(b,h=10)
    return 1/2*b*h
end


tri(12)

tri(12,100)

function vol(l,w,h)
    println("print volum=$l")
    println("print width=$l")
    println("print height=$l")
end

#w=2
vol(1,2,3)
function vol2(;length=10,width=20,height=40)
    println("print length=$length")
    println("print width=$width")
    println("print height=$height")
end

vol2(length=20,width=10,height=40)

count=0
for i in 1:10
println("the valie is $i",global count+=1)
end


function main()
    count=0
    for i in 1:10
        println("$i", count+=1)
    end
end

main()

let count=0
    for i in range(1,stop=10)
        println("the value is $i",count+=1)
    end
end

count=0
for i in 1:10
    println("the value is $i",global count+=1)
end

a,b=rand(10) ,rand(16)
for (i,j) in zip(a,b)
     println(i,"        ",j)
end


#MIT opencourse

function babylion(x;N=10)
    t=(1+x)/2
    for i=2:N t=(t+x/t)/2
    end
    t
end


α=π
babylion(α),√α

x=2; babylion(x),√x


using plotly
plotly()
plot(x->babylion(x,N=i) for i=1:5,i,label=("iterration $j") for i 1:)

exp =:(10+20)




#meta programming @macro and Expresssion


function expr(opd,op1,op2)
       exp=Expr(:call,opd,op1,op2)
       return exp
 end

ex=expr(:+,10,20)
eval(ex)

exp=quote
      a=10
      b=20
      a+b end

exp=:(10+2)
typeof(exp)

(a+b*c+10) == Meta.parse("a+b*c+10")

(a+b*c+10) == Meta.parse("a+b*c+10")==Expr(:call,:+,a:,Expr(:call,:*,:b,:c),10)

exp=:($a + b)

function expr(opd,op1,op2)
       exp=exp(:call,opd,op1,op2)
       return exp
       end

ex=expr(:+,10,Expr(:call,:*,20,30)):(10 + 20 * 30)

ex=expr(:+,10,Expr(:call,:*,20,30))

 exp=Expr(:call,:+,x,:y)
x=10
y=50

eval(exp)

@eval(exp)

#note eval() is a function @eval is a macro

#use interpolation to get the evaluation
@eval $(e)

@eval $(e)=eval(e)#shoul be true



#as now you know expresiion lets roll with macro
macro arg(x)
    show(x)
end

@arg(z)

@arg(100+100)

macro assert(exp)
    return:($exp ? nothing : throw(chutiyaError($(string(exp)))))
end



@assert 10==10.1










#USING DATAFRAME
using CSV#IMPORT STATEMENT
using DataFrames, ScikitLearn#IMPORT DATAFRAME AND SCIKITLEARN
df=CSV.read("C:\\Desktop\\Julia\\archive\\Case.csv")#READ THE csv
head(df)#HEAD OF THE df
tail(df)#LAST DF
describe(df)#DESCRIBE THE df
summary(df)#SHAPE OF THE df
repeat(df)#REPEAT THE df
first(df)#FIRST VALUES
last(df,8)#LAST 8 VALUES
unique(df,2)#unique values
unique(df,1)#unique values


df1=DataFrame(a=1:7,b=3:9)#Dataframe with ranges
df2=select(df1,:a=>:b)#only select b
df2=select(df1,Not(:a))#drop a column
