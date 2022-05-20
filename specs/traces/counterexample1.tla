---------------------------- MODULE counterexample ----------------------------

EXTENDS clock

(* Constant initialization state *)
ConstInit == TRUE

(* Initial state *)
State0 == action = "Init" /\ am = TRUE /\ hour = 0

(* Transition 0 to State1 *)
State1 == action = "Tick" /\ am = TRUE /\ hour = 1

(* Transition 0 to State2 *)
State2 == action = "Tock" /\ am = TRUE /\ hour = 2

(* Transition 0 to State3 *)
State3 == action = "Tick" /\ am = TRUE /\ hour = 3

(* Transition 0 to State4 *)
State4 == action = "Tock" /\ am = TRUE /\ hour = 4

(* Transition 0 to State5 *)
State5 == action = "Tick" /\ am = TRUE /\ hour = 5

(* Transition 0 to State6 *)
State6 == action = "Tock" /\ am = TRUE /\ hour = 6

(* Transition 0 to State7 *)
State7 == action = "Tick" /\ am = TRUE /\ hour = 7

(* Transition 0 to State8 *)
State8 == action = "Tock" /\ am = TRUE /\ hour = 8

(* Transition 0 to State9 *)
State9 == action = "Tick" /\ am = TRUE /\ hour = 9

(* Transition 0 to State10 *)
State10 == action = "Tock" /\ am = TRUE /\ hour = 10

(* Transition 0 to State11 *)
State11 == action = "Tick" /\ am = TRUE /\ hour = 11

(* Transition 0 to State12 *)
State12 == action = "Tock" /\ am = FALSE /\ hour = 0

(* The following formula holds true in the last state and violates the invariant *)
InvariantViolation == ~(am = am')

================================================================================
(* Created by Apalache on Fri May 20 12:26:51 CEST 2022 *)
(* https://github.com/informalsystems/apalache *)
