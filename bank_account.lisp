(defvar account (list "balance" (float 0)))


(defun  get-balance-of (account)
  (second account))


(defun  print-balance-of (account)
  (print (get-balance-of account)))


(defun  set-balance-of (account to-this-amount)
(cond
  ((numberp to-this-amount) (setf (second account) (float to-this-amount)))
  ( t                       (setf (second account) (float (get-balance-of account))))))


(defun  deposit-amount-into (account this-amount)
(cond
  ((numberp this-amount) (set-balance-of account (+ (get-balance-of account) this-amount)))
  ( t                    (set-balance-of account (+ (get-balance-of account) (float 0))))))


(defun  withdraw-amount-from (account this-amount)
(cond
  ((not
    (numberp this-amount))
    (write-line "Cannot withdraw something that isn't a number. Canceling withdrawal."))
  ((or
    (< (get-balance-of account) (float 0))
    (< (- (get-balance-of account) this-amount) (float 0)))
    (write-line "Cannot withdraw because account is under 0 or withdrawing would put it under 0. Canceling withdrawal."))
  ( t
    (set-balance-of account (- (get-balance-of account) this-amount)))))

(defun  print-menu ()
  (write-line "--- Main Menu ---")
  (write-line "1) Withdraw      ")
  (write-line "2) Deposit       ")
  (write-line "3) Goodbye       "))


(defun please-enter-choice ()
  (write-line "Please enter a  choice (integer)"))
(defun please-enter-amount ()
  (write-line "Please enter an amount (integer)"))


;(print-balance-of account)
;(set-balance-of account 100.5)
;(print-balance-of account)
;(deposit-amount-into account 100.0)
;(deposit-amount-into account "fail")
;(print-balance-of account)
;(withdraw-amount-from account 1000)
;(withdraw-amount-from account "fail")
;(withdraw-amount-from account 2)
;(print-balance-of account)


(loop (let ((choice 0)
            (amount 0)))
  (print-menu)
  (print-balance-of account)
  (princ #\linefeed)
  (princ #\linefeed)
  (please-enter-choice)
  (setf choice (parse-integer (read-line)))
  (if (= choice 3) (ext:exit))
  (princ #\linefeed)
  (please-enter-amount)
  (setf amount (parse-integer (read-line)))
  (cond
  ((= choice 1)
    (withdraw-amount-from account amount))
  ((= choice 2)
    (deposit-amount-into account amount))))
