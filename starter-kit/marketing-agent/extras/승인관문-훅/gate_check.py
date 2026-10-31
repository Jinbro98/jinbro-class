#!/usr/bin/env python3
"""승인 관문 훅 (PreToolUse).

클로드가 도구를 쓰기 직전에 실행된다. 게시 · 발송 · 삭제처럼 되돌리기 어려운 동작이면
사용자에게 허락을 묻는 창을 띄운다(ask). 나머지는 아무 말 없이 통과시킨다.
CLAUDE.md의 '승인 관문'은 클로드가 지키기로 한 약속이고, 이 훅은 약속을 잊어도 걸리는 안전장치다.
"""
import json
import re
import sys

# MCP 도구 이름에 이런 단어가 들어 있으면 외부로 내보내는 동작으로 본다
OUTBOUND_TOOL = re.compile(r"(post|publish|send|tweet|thread|upload|schedule|create_(post|media)|reply)", re.I)
# 터미널 명령 중 외부로 보내거나 지우는 것
RISKY_BASH = [
    (re.compile(r"\bcurl\b.*(-X\s*(POST|PUT|DELETE)|--data|\s-d\s|-F\s)", re.I), "외부 서버로 데이터를 보내는 명령"),
    (re.compile(r"(^|[;&|]\s*)(rm|rmdir|del|Remove-Item)\b", re.I), "파일 삭제 명령"),
]


def ask(reason):
    print(json.dumps({
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "ask",
            "permissionDecisionReason": f"승인 관문: {reason}. 진행할지 직접 확인해 주세요.",
        }
    }, ensure_ascii=False))
    sys.exit(0)


def main():
    data = json.load(sys.stdin)
    tool = data.get("tool_name", "")
    tool_input = data.get("tool_input", {}) or {}

    if tool.startswith("mcp__") and OUTBOUND_TOOL.search(tool):
        ask(f"외부 서비스로 내보내는 도구({tool})")

    if tool in ("Bash", "PowerShell"):
        command = tool_input.get("command", "")
        for pattern, label in RISKY_BASH:
            if pattern.search(command):
                ask(label)

    sys.exit(0)  # 해당 없음: 평소대로 진행


if __name__ == "__main__":
    main()
