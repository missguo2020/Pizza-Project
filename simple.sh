#!/bin/bash

#----------------------
#Contributors: Yordanos, Li Jin, Yasemin
#Date: 01/20/2021

#Description: Pizza ordering process for Simply Delicious Pizza Place
#Size, crust selection, toppings selection, displaying order summary and total price

#-----------------------
#Version: 1.12
#-----------------------

clear

#initiate variables
c=1 #counter
a=0 #array position
order=(Pickup Delivery)
size=(Small Medium Large XLarge)
crust=(Thin NY_Style Sicilian)
toppings=(Pepperoni Ham Tomatoes Onions Jalapeno Cheese Red_Pepper Black_Olives)
drinks=(Coke Ice_tea Beer)
price=('$2' '$2.99' '$1')
selections=0 #consider -1 array position is the picking up the last item 

#greeting customer

echo "     Welcome to Simply Delicious Pizza"
read -p "Please enter your name >> " name
echo ""
echo "Hello $name, We are happy to see you again :) "
echo ""
echo "Please enter you order below"
echo ""
sleep 1

# putting order types
echo "        Order Type "
echo "--------------------------------"
counter=1
for t in ${order[@]} 
    do
        echo "$counter. $t"
        ((counter ++))
    done

#ask crust type
read -p "Choose Order [1-2]" selections[$a]
while [ ${selections[$a]} -gt 2 ] #this avoids gt 2  /consider avoding inputs lt 1 or negative or laters
    do #allows us to recursively ask to put correct inputs from user 
        read -p "Wrong order option, please choose again [1-2]" selections[$a] 
    #consider else/for non intiger inputs
    #read -p "wrong order option, please choose again $c [1-2]" selections[$a]
    done


#list summary order
echo ""
sleep 1
echo "You have selected order for ${order[${selections[$a]}-1]}  "
sleep 1

#pizza size
echo ""
echo "Choose pizza size"
sleep 1
echo "      Size"
echo "-------------------------------"
counter=1
for t in ${size[@]}
    do
        echo "$counter. $t"
        ((counter ++))
    done

read -p "Choose Size [1-4]" selections[$a]
while [ ${selections[$a]} -gt 4 ]
    do
        read -p "Wrong order option, please choose again [1-4]" selections[$a]
    done

echo ""
echo "You have selected ${size[${selections[$a]}-1]}, Great Choice! "
sleep 1


# putting order types
echo ""
echo "Choose your crust"
sleep 1
echo "        Crust "
echo "--------------------------------"
counter=1
for t in ${crust[@]}
    do
       echo "$counter. $t"
       ((counter ++))
    done

#ask order type
read -p "Choose Crust [1-3]" selections[$a]
while [ ${selections[$a]} -gt 3 ]
    do
        read -p "Wrong order option, please choose again [1-3]" selections[$a]
    done


#list summary order
sleep 1
echo ""
echo "You have selected ${crust[${selections[$a]}-1]} crust for ${price[0]}, Great Choice! "
sleep 1
#give user a list of topping options
echo ""
echo "Choose 4 toppings" # consider to allow user to choose how many toppings , consider not allowing same topping selection
sleep 2
echo ""
echo '         Toppings'
echo "--------------------------------"
counter=1
for t in ${toppings[@]}
    do
        echo "$counter. $t"
        ((counter ++))
    done
sleep 2
#consider asking how many toppings they want
#read -p "How many toppings would you like? Enter 1-8 >> " nt

#while loop to ask topping question
echo ""
while [ $c -lt 5 ]
    do
        read -p "Topping $c [1-8]" selections[$a] 
        while [ ${selections[$a]} -gt 8 ] #ADD LESS THAN 1
            do
                read -p "Topping must be 1-8. Choose topping $c [1-8]" selections[$a]
            done
                ((c++))
                ((a++)) 
    done
sleep 1
#listing summery of toppings
echo ""
echo -e "You have selected:
\n${toppings[${selections[0]}-1]} for ---- ${price[1]}
\n${toppings[${selections[1]}-1]} for ---------- ${price[1]}
\n${toppings[${selections[2]}-1]} for ----- ${price[1]} 
\n${toppings[${selections[3]}-1]} for ------- ${price[1]}
\nExcellent Choice!!! "
echo ""
echo "Would you like to order drink? [y / n]" #consider else input
read input
if [ $input == "y" ]; then  
    echo ""
    echo "Choose your Drink"
    sleep 1
    echo "        Drink "
    echo "--------------------------------"
    counter=1
    for t in ${drinks[@]}
        do
            echo "$counter. $t"
            ((counter ++))
        done

#ask order type
    read -p "Choose Drink [1-3]" selections[$a]
    while [ ${selections[$a]} -gt 3 ]
        do
            read -p "Wrong order option, Please choose again  [1-3]" selections[$a]
        done
       
#list summary order
    sleep 1
    echo ""
    echo "You have selected ${drinks[${selections[$a]}-1]}  for ${price[2]}"
    sleep 1
    echo "Excellent, $name! "
    echo ""
    sleep 1
    echo  -e "Your total is: 
-------------------------------
    \nCrust ------------ ${price[0]}
    \n4-Topping -------- \$11.96   
    \nDrinks ----------- ${price[2]}
    \nTax ------------- \$2.24
    \nSub Total ------- \$17.20 " # consider Topping ------ 4 * ${price[1]} 
else
    sleep 1
        echo  -e "Excellent, $name!
       Your total is:
-------------------------------
    \nCrust ------------ ${price[0]}
    \n4-Topping -------- \$11.96
    \nTax ------------- \$1.79
    \nSub Total ------- \$15.75 "

fi
echo ""
echo "Your order will be ready in 10 minutes."
echo ""
sleep 2
echo "Thank you for ordering from Simply Delicious Pizza."
echo""
echo "We hope you come visit us again soon!"
