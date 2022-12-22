export interface LocalConfig {
  code: string;
  language: string;
  selectLanguage: string;
  editPage: string;
  lastUpdated: string;
  tip: string;
  warning: string;
  danger: string;
  notFound: string[];
  backToHome: string;
  translationOutdated: string;

  dbName: string;
  dbDescription: string;

  tutorials: string;
  concepts: string;
  recipes: string;
  sampleApps: string;
  changelog: string;
  contributors: string;
}

export function getLocalePath(code: string): string { 
  if (code === "id") {
    return "/";
  } else {
    return "/" + code + "/";
  }
}

export const locales: LocalConfig[] = [
  {
    code: "id",
    language: "Indonesia",
    selectLanguage: "Pilih Bahasa",
    editPage: "Edit Page",
    lastUpdated: "Last Updated",
    tip: "Tip",
    warning: "Warning",
    danger: "Bahaya",
    notFound: [
      "Nothing to see here.",
      "How did we end up here?",
      "This is a four-oh-four...",
      "Looks like we have a broken link.",
    ],
    backToHome: "Kembali ke Home",
    translationOutdated: "Translation is outdated. Please help us update it!",
    dbName: "Telegram Client",
    dbDescription: "Telegram Client library untuk berinteraksi dengan api telegram",
    tutorials: "TUTORIALS",
    concepts: "CONCEPTS",
    recipes: "RECIPES",
    sampleApps: "Sample Apps",
    changelog: "Changelog",
    contributors: "Contributors",
  }, 
  {
    code: "en",
    language: "English",
    selectLanguage: "Select Language",
    editPage: "Edit Page",
    lastUpdated: "Last Updated",
    tip: "Tip",
    warning: "Warning",
    danger: "Danger",
    notFound: [
      "Nothing to see here.",
      "How did we end up here?",
      "This is a four-oh-four...",
      "Looks like we have a broken link.",
    ],
    backToHome: "Back to Home",
    translationOutdated: "Translation is outdated. Please help us update it!",
    dbName: "Telegram Client",
    dbDescription: "Easy Telegram Client Library For Flutter And Dart Server Side",
    tutorials: "TUTORIALS",
    concepts: "CONCEPTS",
    recipes: "RECIPES",
    sampleApps: "Sample Apps",
    changelog: "Changelog",
    contributors: "Contributors",
  }, 
];
