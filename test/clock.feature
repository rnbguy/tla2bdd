Feature: MBT trace
    Scenario: counterexample1
        Given Init: {"am": true, "hour": 0}

         When Tick: {"am": true, "hour": 1}
         When Tock: {"am": true, "hour": 2}
         When Tick: {"am": true, "hour": 3}
         When Tock: {"am": true, "hour": 4}
         When Tick: {"am": true, "hour": 5}
         When Tock: {"am": true, "hour": 6}
         When Tick: {"am": true, "hour": 7}
         When Tock: {"am": true, "hour": 8}
         When Tick: {"am": true, "hour": 9}
         When Tock: {"am": true, "hour": 10}
         When Tick: {"am": true, "hour": 11}

         Then Tock: {"am": false, "hour": 0}
