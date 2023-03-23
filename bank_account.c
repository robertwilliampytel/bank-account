#include <stdio.h>
#include <stdlib.h>


typedef struct Account {
  double balance;
  double interest_rate_percent;
} Account;


void see_current_balance(const Account *);
void menu(void);
void please_enter(void);
void please_check(void);
void possible_negative_account(void);
void insufficient_funds_to_withdraw(double);

Account * deposit_amount(Account *, double);
Account * withdraw_amount(Account *, double);


int main()
{
  Account *account = malloc(sizeof(Account));
  
  account->balance = 0.0;
  account->interest_rate_percent = 0.01;  
  
  int choice = 0;
  double amount = 0.0;
  
  do
  {
    menu();
    see_current_balance(account);
    please_enter();
    
    scanf("%d", &choice);
    
    while ( ! (choice == 1 || choice == 2 || choice == 3) )
    {
      printf("Please enter a valid choice.\n");
      scanf("%d",  &choice);
    }
    
    if (choice == 3) { break; }
    
    scanf("%lf", &amount);
    
    if (choice == 1) { withdraw_amount(account, amount); }
    if (choice == 2) {  deposit_amount(account, amount); }
    
  } while (choice == 1 || choice == 2);
  
  printf("Thank you for banking with us!\nGoodbye.\n");
  free(account);
  
  return 0;
}


void see_current_balance(const Account * account)
{
  printf("Your current balance is: %.2f\n", account->balance);
}


void menu(void)
{
  printf(".__________.\n");
  printf("|-- Menu --|\n");
  printf("1) Withdraw\n");
  printf("2) Deposit\n");
  printf("3) Goodbye\n");
}

void please_enter(void)
{
  printf("Please enter a valid choice followed by an amount in dollars and cents\n");
}

void please_check(void)
{
  printf("Please check your current balance\n");
}

void possible_negative_account(void)
{
  printf("Your account is either at or under 0.0\n");
}

void insufficient_funds_to_withdraw(double amount)
{
  printf("Your account does not have sufficient funds to withdraw %.2f\n", amount);
}



Account * deposit_amount(Account * account, double amount)
{
  account->balance += amount;
  
  printf("You deposited %.2f\n", amount);
  
  return account;
}


Account * withdraw_amount(Account * account, double amount)
{
  if (account->balance <= 0.0)
  {
    possible_negative_account();
    please_check();
    return account;
  }
  else if ( (account->balance - amount) < 0.0)
  {
    insufficient_funds_to_withdraw(amount);
    please_check();
    return account;
  }
  else
  {
    account->balance -= amount;
    printf("You withdrew %.2f\n", amount);
    return account;
  }
}
