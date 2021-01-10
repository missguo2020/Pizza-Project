#!/bin/bash

#initiate variables
c=1
a=0
order=(pickup delivery)
crust=(thin NY_style sicilian)
options=(Pepperoni Ham Tomatoes Onions Jalapeno Cheese Red_Pepper Black_Olives)
drinks=(coke ice_tea beer)
price=('$2' '$2.99' '$1')

#greeting customer

echo "     Welcome to linux pizza"
read -p "please enter your name >> " name
echo ""
echo "Hello $name we are happy to see you again :) "
echo ""
echo "please enter you orders below"
echo ""
sleep 1
# putting order types

echo "        order type. "
echo "--------------------------------"
counter=1
for t in ${order[@]}
    do
        echo "$counter. $t"
        ((counter ++))
    done

#ask crust type
         read -p "choos order [1-2]" selections[$a]
    if [ ${selections[$a]} -gt 2 ]
          then
          read -p "wrong order option, please choose again $c [1-2]" selections[$a]
          #else/for non intiger inputs
          #read -p "wrong order option, please choose again $c [1-2]" selections[$a]
    fi
         ((tc++))
         ((ta++))  

#list summary order
echo ""
sleep 1
echo "you have selcted order for ${order[${selections[0]}-1]}  "
sleep 1

# putting order types
echo ""
echo "choos your crust"
sleep 1
echo "        crust. "
echo "--------------------------------"
counter=1
for t in ${crust[@]}
    do
       echo "$counter. $t"
       ((counter ++))
    done

#ask order type
         read -p "choos crust [1-3]" selections[$a]
         if [ ${selections[$a]} -gt 3 ]
          then
          read -p "wrong order option, please choose again $c [1-3]" selections[$a]
         fi
         ((tc++))
         ((ta++))  

#list summary order
sleep 1
echo ""
echo "you have selcted ${crust[${selections[0]}-1]} crust fo ${price[0]}, good choice! "
sleep 1
#give user a list of topping options
echo ""
echo "Choose your toppings, maximum of four toppings"
sleep 2
echo ""
echo '         Toppings'
echo "--------------------------------"
counter=1
for t in ${options[@]}
    do
        echo "$counter. $t"
        ((counter ++))
    done
sleep 2
#ask how many toppings they want
#read -p "How many toppings would you like? Enter 1-8 >> " nt

#while loop to ask topping question
echo ""
while [ $c -lt 5 ]
    do
            read -p "topping $c [1-8]" selections[$a] 
        if [ ${selections[$a]} -gt 8 ] #ADD LESS THAN 1
            then
            read -p "Topping must be 1-8. choose topping $c [1-8]" selections[$a]
        fi
           ((c++))
           ((a++)) 
    done
sleep 1
#listing summery of toppings
echo ""
echo -e "you have selected:
\n${options[${selections[0]}-1]} for ---- ${price[1]}
\n${options[${selections[1]}-1]} for ---------- ${price[1]}
\n${options[${selections[2]}-1]} for ----- ${price[1]} 
\n${options[${selections[3]}-1]} for ------- ${price[1]}

\nexcellent choice!!! "
echo ""
echo "would you like to order drinks? [y / n]" 
read input
if [ $input == "y" ]; then  
    echo ""

    sleep 1
    echo "        drinks. "
    echo "--------------------------------"
    counter=1
    for t in ${drinks[@]}
        do
        echo "$counter. $t"
        ((counter ++))
        done

#ask order type
    read -p "choos drink [1-3]" selections[$a]
    if [ ${selections[$a]} -gt 3 ]
        then
        read -p "wrong order option, please choose again $c [1-3]" selections[$a]
    fi
       
echo $sub
#list summary order
    sleep 1
    echo ""
    echo "you have selcted ${drinks[${selections[0]}-1]}  for ${price[2]}"
    sleep 1
echo "ok $name"
echo ""
sleep 1
echo  -e "your total is:
-------------------------------
\ncrust ------------ ${price[0]}
\n4-topping -------- \$11.96
\ndrinks ----------- ${price[2]}
\ntax ------------- \$2.24
\nsub total ------- \$17.20 "
else
sleep 1
    echo  -e "ok $name
     your total is:
-------------------------------
\ncrust ------------ ${price[0]}
\n4-topping -------- \$11.96
\ntax ------------- \$1.79
\nsub total ------- \$15.75 "
fi