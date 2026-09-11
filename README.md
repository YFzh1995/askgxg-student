# AskGXG-student

面向财会、商科在校生的求职类 AI Skill 集合，配合《观星哥校招宝典（财会商科版）》使用。

每个 Skill 解决一个具体问题，处理学生手上的真实材料——一条招聘、一段经历、一次面试。它不是知识库，不是提示词合集，也不是文章末尾的赠品。读正文获得的是通用判断方法，Skill 做的是把它用在你这一个具体材料上。

## 已发布

| Skill | 名称 | 解决什么 | 对应正文 |
| --- | --- | --- | --- |
| `askgxg-student-company-reading` | 看懂公司和行业 | 拿到一家公司的招聘，不知道它是靠什么赚钱的 | 第二章 2.1 看懂行业和公司 |
| `askgxg-student-job-reading` | 看懂岗位 | 拿到一条招聘，看不懂职责实际指什么工作 | 第二章 2.2 看懂岗位 |

其余 Skill 正在开发，会陆续加入。

## 安装

Skill 需要放在支持 Skill 机制的环境里，推荐使用 WorkBuddy。

### WorkBuddy：一条命令

macOS / Linux 打开「终端」，把下面这行整个复制进去，回车：

```
curl -fsSL https://raw.githubusercontent.com/YFzh1995/askgxg-student/main/install.sh | bash
```

装完重启 WorkBuddy，技能才会被加载。

这行命令只做一件事：把仓库里的技能文件夹复制到 `~/.workbuddy/skills/`。不改系统设置，不装别的软件。

Windows 请用下面的手动方式。

### 手动安装

点本页右上角绿色的 Code 按钮，选 Download ZIP。解压后，把 `skills/` 里的每个文件夹整个复制到下面这个位置：

| 环境 | 放置位置 |
| --- | --- |
| WorkBuddy（Windows） | `C:\Users\你的用户名\.workbuddy\skills\` |
| WorkBuddy（macOS / Linux） | `~/.workbuddy/skills/` |
| opencode（Windows） | `C:\Users\你的用户名\.config\opencode\skills\` |
| opencode（macOS / Linux） | `~/.config/opencode/skills/` |

文件夹不存在就自己新建，名字要一模一样。复制完重启工作环境，Skill 才会被加载。

**要用复制，不要用快捷方式。** WorkBuddy 的技能扫描不跟随符号链接，用链接指过去会扫不到。

### 其他环境

如果用的是 opencode、Codex、Claude Code 这类工具，也可以让 `skills` 命令行来装：

```
npx skills add YFzh1995/askgxg-student -g --copy
```

**WorkBuddy 用户不要用这条命令。** 它目前不识别 WorkBuddy 的技能目录，会把文件装到别的地方——或者建一个 WorkBuddy 扫不到的符号链接。

## 怎么用

装好以后用自然语言说话就行，不需要记命令。

以「看懂岗位」为例：

- 「用看懂岗位帮我看这份招聘」
- 或者直接把招聘信息贴过来，问「这个岗位到底干什么」

「看懂公司和行业」同理：

- 「这家公司我不了解，帮我讲讲它做什么生意」
- 「我拿到 XX 公司的招聘，它到底是靠什么赚钱的」

也可以直接点名调用：

```
/askgxg-student-job-reading
/askgxg-student-company-reading
```

## 目录结构

```
install.sh                          # 安装脚本
skills/
├── askgxg-student-company-reading/
│   └── SKILL.md
└── askgxg-student-job-reading/
    └── SKILL.md
```

一个 Skill 一个目录，目录名与 `SKILL.md` 里的 `name` 字段一致。单文件为主——内容规模需要独立维护清单时才会拆出 `references/`。

## 命名规则

系列统一前缀 `askgxg-student-`，后接「对象＋动作」两段式描述，不使用缩写与编号。展示层写作 `AskGXG-student-XXX`，工程层（目录名、调用名、`name` 字段）统一小写。

## 版权

Copyright © 2026 YFzh1995. 保留所有权利。
