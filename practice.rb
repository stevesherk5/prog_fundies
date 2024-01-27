# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 },
  { "from_user" => "ben", "to_user" => "SHERK", "amount" => 1000000}
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

coin_owners = []

# Go through each transaction to extract data 
for transaction in blockchain 
  
  # find out the payer, receiver, and amount 
  payer = transaction["from_user"]
  receiver = transaction["to_user"]
  amount = transaction["amount"]
  
  # set index to zero. this will help me find out which balances to update later
  index = 0

  # set payer/receiver variables. these will be updated later 
  paycheck = 0
  pay_row = 0
  existing_payer_balance = 0
  new_payer_balance = 0

  reccheck = 0
  rec_row = 0
  existing_receiver_balance = 0
  new_receiver_balance = 0

  # go through coin_owners array and see whether the payer or receiver have an existing balance
  # if they have an existing balance, then we'll use the current transaction amount to make 
  # changes later 
  for row in coin_owners
    if row["name"]==receiver
      reccheck = 1
      rec_row = index
      existing_receiver_balance = row["balance"]
      new_receiver_balance = existing_receiver_balance + amount    
    end
    if row["name"]==payer
      paycheck = 1
      pay_row = index
      existing_payer_balance = row["balance"]
      new_payer_balance = existing_payer_balance - amount 
    end
    index = index+1
  end

  # if the receiver has an existing balance, update their balance based on the transaction amount
  # if the receiver doesn't have a balance, create a new hash in the coin_owners array to establish
  # the receiver's new balance 
  if reccheck == 1
    coin_owners[rec_row].replace("name"=>receiver,"balance"=>new_receiver_balance)
  else 
    coin_owners.push("name"=>receiver,"balance"=>amount)
  end

  # same process as above, but for the payers 
  if paycheck == 1
      coin_owners[pay_row].replace("name"=>payer,"balance"=>new_payer_balance)
  else 
    coin_owners.push("name"=>payer,"balance"=>-amount)
  end
   
end

# outputs the balance of every person who has transacted with this coin (except nil, in the ICO)
for row in coin_owners
  if row["name"] != nil
    puts "#{row["name"]}'s KelloggCoin balance is #{row["balance"]}"
  end
end


# ---------------------------
# ALTERNATE WAY TO DO THE CODE. 
# THIS METHOD IS NOT DYNAMIC, BUT DOES THE JOB GIVEN THE ORIGINAL DATA
# ---------------------------

# ben_coin=0
# brian_coin=0
# evan_coin=0
# anthony_coin=0

# for ben_transaction in blockchain 
#   if ben_transaction["to_user"] == "ben"
#     ben_coin = ben_coin + ben_transaction["amount"]
#   end

#   if ben_transaction["from_user"] == "ben"
#     ben_coin = ben_coin - ben_transaction["amount"]
#   end 
# end

# for brian_transaction in blockchain 
#   if brian_transaction["to_user"] == "brian"
#     brian_coin = brian_coin + brian_transaction["amount"]
#   end

#   if brian_transaction["from_user"] == "brian"
#     brian_coin = brian_coin - brian_transaction["amount"]
#   end 
# end

# for evan_transaction in blockchain 
#   if evan_transaction["to_user"] == "evan"
#     evan_coin = evan_coin + evan_transaction["amount"]
#   end

#   if evan_transaction["from_user"] == "evan"
#     evan_coin = evan_coin - evan_transaction["amount"]
#   end 
# end

# for anthony_transaction in blockchain 
#   if anthony_transaction["to_user"] == "anthony"
#     anthony_coin = anthony_coin + anthony_transaction["amount"]
#   end

#   if anthony_transaction["from_user"] == "anthony"
#     anthony_coin = anthony_coin - anthony_transaction["amount"]
#   end 
# end

# puts "Ben's KelloggCoin balance is #{ben_coin}"
# puts "Brian's KelloggCoin balance is #{brian_coin}"
# puts "Evan's KelloggCoin balance is #{evan_coin}"
# puts "Anthony's KelloggCoin balance is #{anthony_coin}"