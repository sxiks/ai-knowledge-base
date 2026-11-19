# Evaluation Criteria

Every resource is evaluated using the following criteria.

| Criterion | Weight |
|-----------|-------:|
| Practical Value | 25% |
| Compatibility | 20% |
| Community | 15% |
| Documentation | 15% |
| Maintainability | 10% |
| Learning Value | 10% |
| Future Potential | 5% |

Final score determines recommendation level.

---

## Knowledge Extraction Score (KES)

The KES is the weighted score of the criteria above, on a 0–10 scale:

```text
KES = Σ (criterion score × weight)
```

- Each criterion is scored from 0 to 10.
- The result is rounded to one decimal.
- Reviews record the score of every criterion, not only the total.

The KES is calculated this way from the RPT-002 architecture review onward. Scores recorded in the RPT-001 reviews, ADR-001 to ADR-003 and the existing resource files were assigned before this method was defined; they are kept as historical values.

The score thresholds for each recommendation level are not defined yet.
