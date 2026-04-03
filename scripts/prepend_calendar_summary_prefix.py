from icalendar import Calendar
import sys


if len(sys.argv) != 4:
    print("Usage: python3 prepend_calendar_summary_prefix.py <prefix> <input.ics> <output.ics>")
    sys.exit(1)

prefix = sys.argv[1].strip()
PREFIX = f"{prefix} "

input_file = sys.argv[2]
output_file = sys.argv[3]

with open(input_file, "rb") as f:
    cal = Calendar.from_ical(f.read())

for component in cal.walk():
    if component.name == "VEVENT":
        summary = component.get("SUMMARY")
        if summary:
            s = str(summary)
            if not s.startswith(PREFIX):
                component["SUMMARY"] = PREFIX + s

with open(output_file, "wb") as f:
    f.write(cal.to_ical())

print("Done.")