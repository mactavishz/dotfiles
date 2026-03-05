# Agent Post-Mortem

Template and example for post-mortem analysis of mistakes made by an agent. This is intended to help the agent learn from its mistakes and improve over time.

## Template

```md
**User's Original Request:** "[Briefly summarize or paste what the user asked for]"
**Action Taken (The Mistake):** "[Describe the incorrect action, hallucination, or formatting error generated in the response]"
**User's Feedback:** "[Summarize the user's correction, e.g., 'You used Python 2 syntax instead of Python 3,' or 'Your tone was too formal.']"
**Root Cause Analysis:** "[Why did I make this mistake? e.g., 'I relied on outdated training data regarding library X,' 'I misunderstood the ambiguity in the prompt,' or 'I ignored the user's global formatting constraints.']"
**RULE (Takeaway):** [e.g., "Always use Python 3 f-strings instead of `.format()` unless explicitly asked otherwise." or "Never use bullet points when summarizing fictional narratives."]
```

## Categories

Use these categories to organize post-mortems:

- **Architecture** - System design decisions
- **Testing** - Test coverage, edge cases
- **Performance** - Speed, memory, efficiency
- **Security** - Vulnerabilities, auth issues
- **API** - Interface design, contracts
- **Tooling** - Build, deploy, CI/CD
- **Communication** - Misunderstandings, unclear specs

## Example Post-Mortem

```md
# Post Mortems

## 2024-06-01 12:00 PM - [Architecture] Misunderstood User's Request for a Microservice

**User's Original**: A user asked for a microservice to handle image uploads
**Action Taken**: I designed a monolithic service that included image processing, storage, and user management all in one.
**User's Feedback**: "I wanted a microservice that only handles image uploads, not a monolith with extra features."
**Root Cause Analysis**: I failed to recognize the user's emphasis on "microservice" and defaulted to a more complex design based on my training data.
**RULE (Takeaway)**: Always clarify the scope of a service when the user specifies "microservice" to avoid over-engineering. Focus on the single responsibility principle.

## 2024-06-02 3:00 PM - [Testing] Missed Edge Case in Input Validation

**User's Original**: A user asked for a function to validate email addresses.
**Action Taken**: I implemented a regex-based validator that worked for most cases but failed for some edge cases like internationalized email addresses.
**User's Feedback**: "Your email validator doesn't work for internationalized email addresses
**Root Cause Analysis**: I relied on a common regex pattern that didn't account for the full range of valid email formats, especially those with non-ASCII characters.
**RULE (Takeaway)**: When implementing input validation, always consider edge cases and internationalization
```

## Best Practices

1. **Write immediately** - Capture lessons right after the correction, not later
2. **Be specific** - Vague lessons don't prevent mistakes
3. **Include context** - Future you needs to understand why this matters
4. **Make rules actionable** - "Be more careful" is not a rule
5. **Review regularly** - Scan lessons at session start for relevant projects
