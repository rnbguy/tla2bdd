# tla2bdd

Generate BDD scenarios from TLA traces

```sh
apalache check --inv=Inv --run-dir=specs/traces --length=30 specs/clock.tla # generated tla traces are at specs/traces

python tla2bdd.py specs/traces test/clock.feature # generated clock.feature file is at test/clock.feature

pytest -rP # the test file is at test/test_clock.py
```
