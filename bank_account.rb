class Account
  def initialize(balance)
    @balance = balance
  end
  
  def balance
    @balance
  end
  
  def menu()
    puts ".--------."
    puts "|--Menu--|"
    puts ".--------."
    puts "1 > Withdraw"
    puts "2 > Deposit"
    puts "3 > Goodbye"
    puts ""
  end
  
  def show_balance()
    puts "Current balance is " + @balance.to_s
  end
  
  def deposit(amount)
    amount    = amount.to_f
    @balance += amount
    puts "You deposited " + amount.to_s
  end

  def withdraw(amount)
    amount = amount.to_f
    
    if amount.zero? then
      puts "Cannot withdraw zero or invalid amount."
      return
    end
    
    if @balance - amount < 0.0 then
      puts "Insuffient funds to withdraw."
      return
    end
    
    @balance -= amount
    puts "You withdrew " + amount.to_s
  end 
end


if __FILE__ == $0 then

  account = Account.new(0.0)
  active  = true
  amount  = 0.0
  choice  = 0
  
  
  while active do
    
    account.menu
    account.show_balance
    
    choice = $stdin.gets.chomp.to_i
    while choice == 0 || (not (choice == 1 || choice == 2 || choice == 3)) do
      puts "Invalid choice. Please input a valid one."
      choice = $stdin.gets.chomp.to_i
    end
    
    if choice == 1 then
      puts "Please input an amount to withdraw"
      amount = $stdin.gets.chomp.to_f
      account.withdraw(amount)
    end
    
    if choice == 2 then
      puts "Please input an amount to deposit"
      amount = $stdin.gets.chomp.to_f
      account.deposit(amount)
    end
    
    if choice == 3 then
      active = false
    end
  end
  
  puts "Thank you for banking with us."
  puts "Goodbye!"
end
