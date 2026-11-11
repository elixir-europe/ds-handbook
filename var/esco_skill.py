"""Print a _data/guidance/skills.yml entry for one or more ESCO skills.

Usage:
    python3 var/esco_skill.py http://data.europa.eu/esco/skill/728ad40d-4a79-4b4d-b77b-a48d094d73fa [...]

Looks the skill up in the public ESCO API and prints a YAML block to paste
into _data/guidance/skills.yml. Uses only the standard library.
"""

import json
import re
import sys
import urllib.parse
import urllib.request

API = "https://ec.europa.eu/esco/api/resource/skill"


def fetch(uri):
    query = urllib.parse.urlencode({"uri": uri, "language": "en"})
    with urllib.request.urlopen(f"{API}?{query}", timeout=30) as resp:
        return json.load(resp)


def entry(uri):
    data = fetch(uri)
    label = data["title"]
    description = data.get("description", {}).get("en", {}).get("literal", "")
    key = re.sub(r"[^a-z0-9]+", "-", label.lower()).strip("-")
    return (
        f"- key: {key}\n"
        f"  label: {label}\n"
        f"  uri: {uri}\n"
        f"  description: {json.dumps(description, ensure_ascii=False)}\n"
    )


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    print("\n".join(entry(u) for u in sys.argv[1:]))
