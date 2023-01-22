
class ATM:
    def __init__(self, balance=0, pin=1234):
        self.balance = balance
        self.pin = pin
        self.transactions = []
        self.greeting = "Welcome to SCB ATM"

    def check_balance(self):
        self.transactions.append("Balance check")
        return f'Your current balance is ฿{self.balance}'

    def deposit(self, amount):
        self.balance += amount
        self.transactions.append(f'Deposit of ฿{amount}')
        return f'Your current balance is ฿{self.balance}'

    def withdraw(self, amount, pin):
        if self.check_pin(pin):
            if self.balance >= amount:
                self.balance -= amount
                self.transactions.append(f'Withdraw of ฿{amount}')
                return f'Your current balance is ฿{self.balance}'
            else:
                return "Insufficient funds"
        else:
            return "Incorrect PIN"

    def change_pin(self, old_pin, new_pin):
        if self.check_pin(old_pin):
            self.pin = new_pin
            self.transactions.append("PIN changed")
            return "PIN changed successfully"
        else:
            return "Incorrect PIN"

    def check_pin(self, pin):
        if self.pin == pin:
            return True
        else:
            return False
    
    def check_transactions(self,pin):
        if self.check_pin(pin):
            return self.transactions
        else:
            return "Incorrect PIN"
    def show_greeting(self):
        return self.greeting + "."
    
# create an ATM object
atm = ATM(1000)

# check the balance
print(atm.check_balance()) # should return "Your current balance is ฿1000"

# deposit money
print(atm.deposit(500)) # should return "Your current balance is ฿1500"

# withdraw money
print(atm.withdraw(200, 1234)) # should return "Your current balance is ฿1300"

# change pin
print(atm.change_pin(1234,4321)) # should return "PIN changed successfully"

# check transactions
print(atm.check_transactions(4321)) # should return ["Balance check", "Deposit of ฿500", "Withdraw of ฿200", "PIN changed"]

# show greeting
print(atm.show_greeting()) # should return "Welcome to SCB ATM."
    
