# AskGXG-student

面向财会、商科在校生的求职类 AI Skill 集合。

每个 Skill 解决一个具体问题，处理学生手上的真实材料——一条招聘、一段经历、一次面试。它不是知识库，不是提示词合集，也不是文章末尾的赠品。读正文获得的是通用判断方法，Skill 做的是把它用在你这一个具体材料上。

## 已发布

| Skill | 名称 | 解决什么 |
| --- | --- | --- |
| `askgxg-student-job-reading` | 看懂岗位 | 拿到一条招聘，看不懂职责实际指什么工作 |

## 怎么用

这些 Skill 运行在支持 Skill 机制的工作环境中（如 WorkBuddy）。

安装：把 `skills/<skill-name>/` 整个目录放进工作环境的 Skill 目录（通常为 `~/.workbuddy/skills/`），重启后即可调用。

以「看懂岗位」为例，装好后可以这样说：

- 「用看懂岗位帮我看这份招聘」
- 或者直接把招聘信息贴过来，问「这个岗位到底干什么」

## 目录结构

```
skills/
└── askgxg-student-job-reading/
    └── SKILL.md
```

一个 Skill 一个目录，目录名与 `SKILL.md` 里的 `name` 字段一致。单文件为主——内容规模需要独立维护清单时才会拆出 `references/`。

## 命名规则

系列统一前缀 `askgxg-student-`，后接「对象＋动作」两段式描述，不使用缩写与编号。展示层写作 `AskGXG-student-XXX`，工程层（目录名、调用名、`name` 字段）统一小写。

## 版权

Copyright © 2026 YFzh1995. 保留所有权利。
