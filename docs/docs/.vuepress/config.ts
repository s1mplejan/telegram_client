import { shikiPlugin } from '@vuepress/plugin-shiki'
import { DefaultThemeLocaleData, defineUserConfig, LocaleConfig, SiteLocaleConfig, } from 'vuepress'
import { defaultTheme } from 'vuepress'
import { viteBundler } from 'vuepress'
import { getLocalePath, locales } from './locales'
import * as path from 'path'
import * as fs from 'fs'

const vueLocales: SiteLocaleConfig = {}
for (const locale of locales) {
    vueLocales[getLocalePath(locale.code)] = {
        lang: locale.language,
        title: locale.dbName,
        description: locale.dbDescription,
    }
}

const themeLocales: LocaleConfig<DefaultThemeLocaleData> = {}
for (const locale of locales) {

    themeLocales[getLocalePath(locale.code)] = {
        selectLanguageName: locale.language,
        selectLanguageText: locale.selectLanguage,
        editLinkText: locale.editPage,
        lastUpdatedText: locale.lastUpdated,
        contributorsText: locale.contributors,
        tip: locale.tip,
        warning: locale.warning,
        danger: locale.danger,
        notFound: locale.notFound,
        backToHome: locale.backToHome,
        sidebar: getSidebar({
            locale: locale.code,
            tutorials: locale.tutorials,
            concepts: locale.concepts,
            recipes: locale.recipes,
            sampleApps: locale.sampleApps,
            chnagelog: locale.changelog,
            contributors: locale.contributors,
        }),
    }
}

export default defineUserConfig({
    locales: vueLocales,
    bundler: viteBundler({}),
    theme: defaultTheme({
        logo: "/telegram.png",
        repo: "azkadev/telegram_client",
        docsRepo: "azkadev/telegram_client",
        docsDir: "docs/docs",
        contributors: true,
        locales: themeLocales,
        navbar: [
            {
                text: "pub.dev",
                link: "https://pub.dev/packages/telegram_client",
            },
            {
                text: "Github",
                link: "https://github.com/azkadev",
            },
            {
                text: "Telegram",
                link: "https://t.me/azkadev",
            },
            {
                text: "Youtube",
                link: "https://youtube.com/@azkadev",
            },
        ],
        sidebarDepth: 1,

    }),

    markdown: {
        code: {
            "lineNumbers": false,
            "highlightLines": true,
            "vPre": {
                "block": true,
                "inline": true,
            },
            "preWrapper": true,
        },
    },
    plugins: [
        [
            shikiPlugin({
                theme: "one-dark-pro",
            }),
            {
                name: 'redirect-locale',
                clientConfigFile: path.resolve(__dirname, 'redirect.ts'),
            },
        ],
    ],
    head: [
        [
            "link",
            {
                rel: "icon",
                type: "image/png",
                sizes: "256x256",
                href: `/telegram.png`,
            },
        ],
        [
            "link",
            {
                rel: "icon",
                type: "image/png",
                sizes: "512x512",
                href: `/telegram.png`,
            },
        ],
        [
            "link",
            {
                rel: "stylesheet",
                href: "https://fonts.googleapis.com/css2?family=Montserrat:wght@800&display=swap",
            },
        ],
        ["meta", { name: "application-name", content: "Telegram Client" }],
        ["meta", { name: "apple-mobile-web-app-title", content: "Telegram Client" }],
        [
            "meta",
            { name: "apple-mobile-web-app-status-bar-style", content: "black" },
        ],
        [
            "script",
            {
                async: "",
                src: "https://www.googletagmanager.com/gtag/js?id=G-NX9QJRWFGX",
            },
        ],
        [
            "script",
            {},
            `window.dataLayer = window.dataLayer || [];
                function gtag(){dataLayer.push(arguments);}
                gtag('js', new Date());
                gtag('config', 'G-NX9QJRWFGX');`,
        ],
        [
            "script",
            {},
            `(function(c,l,a,r,i,t,y){
            c[a]=c[a]||function(){(c[a].q=c[a].q||[]).push(arguments)};
            t=l.createElement(r);t.async=1;t.src="https://www.clarity.ms/tag/"+i;
            y=l.getElementsByTagName(r)[0];y.parentNode.insertBefore(t,y);
          })(window, document, "clarity", "script", "ciawnmxjdh");`,
        ],
    ],
})

function getSidebar({ locale, tutorials, concepts, recipes, sampleApps, chnagelog, contributors }) {
    return [
        {
            text: tutorials,
            children: getSidebarChildren(locale, ["tutorials/quickstart.md"])
        },
        {
            text: concepts,
            children: getSidebarChildren(
                locale,
                [
                    // "schema.md",
                    // "crud.md",
                    // "queries.md",
                    // "transactions.md",
                    // "indexes.md",
                    // "links.md",
                    // "watchers.md",
                    // "limitations.md",
                    // "faq.md",
                ],
            ),
        },
    ]
}

function getSidebarChildren(locale: string, children: string[]) {
    const localePath = getLocalePath(locale)
    return children.map((child) => {
        if (locale === "id") {
            return '/' + child
        }
        const file = path.resolve(__dirname, '../', localePath.substring(1), child)
        if (fs.existsSync(file)) {
            return localePath + child
        } else {
            return '/' + child
        }
    });
}