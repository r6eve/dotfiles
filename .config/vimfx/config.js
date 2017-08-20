let customSet = (command, shortcut) => { vimfx.set(`custom.mode.normal.${command}`, shortcut) }

vimfx.set('hints.chars', 'asdfghjkl;')
vimfx.set('hints.sleep', -1)
// vimfx.set('mode.normal.scroll_page_down', '<force><C-f>')
vimfx.set('mode.normal.scroll_page_up', 'b')
vimfx.set('mode.normal.tab_select_previous', '<force><C-k>')
vimfx.set('mode.normal.tab_select_next', '<force><C-j>')
vimfx.set('mode.normal.history_back', '<force><C-h>')
// vimfx.set('mode.hints.exit', '<force><C-[>')
vimfx.set('notify_entered_keys', false)

vimfx.addCommand({
  name: 'bitbucket',
  description: 'BitBucket',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://bitbucket.org/dashboard/repositories', true)
})
customSet('bitbucket', ',b')

vimfx.addCommand({
  name: 'calender',
  description: 'Calender',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://www.google.com/calendar/', true)
})
customSet('calender', ',c')

vimfx.addCommand({
  name: 'drive',
  description: 'Drive',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://drive.google.com/drive/#my-drive', true)
})
customSet('drive', ',d')

vimfx.addCommand({
  name: 'github',
  description: 'GitHub',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://github.com/r6eve', true)
})
customSet('github', ',g')

vimfx.addCommand({
  name: 'docs',
  description: 'Docs',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://docs.google.com', true)
})
customSet('docs', ',k')

vimfx.addCommand({
  name: 'translation',
  description: 'Translation',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://translate.google.co.jp/#en/ja/', true)
})
customSet('translation', ',l')

vimfx.addCommand({
  name: 'mail',
  description: 'Mail',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://mail.google.com/mail/u/0/#all', true)
})
customSet('mail', ',m')

vimfx.addCommand({
  name: 'newsinlevels',
  description: 'NewsInLevels',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://www.newsinlevels.com/', true)
})
customSet('newsinlevels', ',n')

vimfx.addCommand({
  name: 'rss',
  description: 'RSS',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('http://www.inoreader.com/all_articles', true)
})
customSet('rss', ',r')

vimfx.addCommand({
  name: 'githubsearch',
  description: 'SearchCodeInGitHub',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://github.com/search', true)
})
customSet('githubsearch', ',q')

vimfx.addCommand({
  name: 'searchimg',
  description: 'SearchIMG',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://www.google.co.jp/imghp?gws_rd=ssl/', true)
})
customSet('searchimg', ',s')

vimfx.addCommand({
  name: 'tweetdeck',
  description: 'TweetDeck',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://tweetdeck.twitter.com/', true)
})
customSet('tweetdeck', ',t')

vimfx.addCommand({
  name: 'weather',
  description: 'Weather',
}, ({vim}) => {
  vim.window.switchToTabHavingURI('https://www.google.co.jp/search?q=京都%20天気', true)
})
customSet('weather', ',w')
