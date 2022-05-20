from pytest_bdd import scenario, given, when, then, parsers
import json


class ITFParser(parsers.StepParser):
    def parse_arguments(self, name):
        action, data = name.split(":", 1)
        data = json.loads(data.strip())
        data["action"] = action
        return data

    def is_matching(self, name):
        action, _ = name.split(":", 1)
        return action == self.name


@scenario("clock.feature", "counterexample1")
def test_am_pm():
    pass


@given(ITFParser("Init"), target_fixture="clock")
def init(hour, am):
    clock = dict(hour=hour, am=am)
    print(clock)
    return clock


@when(ITFParser("Tick"))
@when(ITFParser("Tock"))
def tick_tock(clock):
    clock["am"] = clock["am"] if clock["hour"] < 11 else not clock["am"]
    clock["hour"] = (clock["hour"] + 1) % 12
    print(clock)


@then(ITFParser("Tick"))
@then(ITFParser("Tock"))
def then_tick_tock(clock):
    assert clock["hour"] == 11
    clock["am"] = clock["am"] if clock["hour"] < 11 else not clock["am"]
    clock["hour"] = (clock["hour"] + 1) % 12
