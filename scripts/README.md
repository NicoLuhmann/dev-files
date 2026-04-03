# Scripts

Small utility scripts for this repository.

## prepend_calendar_summary_prefix.py

Prepends a chosen prefix plus a trailing space to every `VEVENT` summary in an `.ics` file.

Usage:

```bash
python3 prepend_calendar_summary_prefix.py <prefix> <input.ics> <output.ics>
```

Example:

```bash
python3 prepend_calendar_summary_prefix.py u input.ics output.ics
python3 prepend_calendar_summary_prefix.py t input.ics output.ics
```

The script leaves summaries unchanged if they already start with the requested prefix and space.