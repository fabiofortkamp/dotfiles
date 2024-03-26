# stolen from https://www.youtube.com/watch?v=NIyljVEcJKw
try:
    from rich import pretty, traceback, inspect
except ModuleNotFoundError:
    pass
else:
    pretty.install()
    traceback.install(show_locals=False)
