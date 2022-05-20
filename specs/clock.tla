---- MODULE clock ----
EXTENDS Integers

VARIABLES
    \* @type: Int;
    hour,
    \* @type: Bool;
    am,
    \* @type: Str;
    action

Init ==
    /\ hour = 0
    /\ am = TRUE
    /\ action = "Init"

Next ==
    /\ hour' = (hour + 1) % 12
    /\ am' = IF (hour = 11) THEN ~am ELSE am
    /\ action' = IF (action = "Tick") THEN "Tock" ELSE "Tick"


Inv ==
    ~(am /= am')

====