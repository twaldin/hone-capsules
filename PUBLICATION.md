# Publication and preserved capsule identities

The approved derived task implementations and synthetic development fixtures in this repository are released under the [MIT license](LICENSE). Third-party source and dependencies keep their own licenses and notices; [LICENSES.md](LICENSES.md) lists where each capsule's notices live. The Hone engine itself lives in [twaldin/hone](https://github.com/twaldin/hone), also under MIT.

These capsules were published in [twaldin/hone](https://github.com/twaldin/hone) until October 2026 and moved here unchanged when the engine and the capsules were split into separate repositories. The bytes of every capsule directory are the same as in that tree, so capsule IDs and manifest digests did not change.

The approved derived-task scope is:

| Task | Public package | Recorded capsule ID |
| --- | --- | --- |
| TradeUp profit | Development implementation and synthetic fixtures | `cap_5e8c673e8d6f` |
| Monoagent context retention | Development implementation and synthetic fixtures | `cap_09e4382066e6` |
| Floyd block search render | Development implementation and synthetic fixtures | `cap_315fc7287eaa` |
| TradeUp query latency | Terminal task and evaluator source reference | `cap_f91a959a1f65` |
| Floyd custom scoreboard render | Terminal task and evaluator source reference | `cap_62751d238ab7` |

This permission covers the bounded derived tasks shipped here. It does not publish their complete private source applications, private infrastructure, or the withheld terminal inputs, answers and reconstruction material.

Some retained manifests, configs and provenance records say `internal-use-only`, `publicationProhibited`, `private-redacted` or `NOASSERTION-private-owner-source`. Those are frozen records of the earlier distribution decision. The owner's present MIT release supersedes those distribution restrictions for the approved files shipped here. Original source-repository visibility remains private where recorded; it does not change because a derived task is released.

Frozen metadata participates in capsule IDs, full manifest digests and baseline checks. It remains unchanged to preserve those identities. This publication notice grants distribution permission; it is not a new admission receipt, execution authority or assertion that historical measurements apply to an edited package.

Terminal directories are source references with `manifest.reference.json`. Their recorded IDs identify the original contracts, not an admitted public executable bundle. Complete original terminal bundles remain private. See [Capsules](https://github.com/twaldin/hone/blob/main/docs/capsules.md) in the engine docs.
