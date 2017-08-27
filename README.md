#### I18nTestRepro

This repo exists to show how `I18n.locale` can leak between requests via the usage
of Thread Local Storage(TLS), a.k.a `Thread.current`.

To replicate, have two tabs open (this may take a few retries)

- `bundle install`
- `rails s` (This application runs `Puma` with max 5 threads.)
- On one tab open (`Tab1`) open `http://localhost:3000?locale=es`
  - Only `MainController#index` sets `I18n.locale` to `params[:locale]` if present one or `I18n.default_locale`
- On another tab (`Tab2`) open `http://localhost:3000/foo`
  - This controller action is not tampering with `I18n.locale` and expects it to return `en` (the default locale)
- Now, try to refresh both tabs as simultaneously/quickly as possible (simulating a high concurrency env).
- Eventually notice, on `Tab2` the current locale being rendered is no longer `en` but `es`

Here is a screen capture demonstrating the above: https://www.dropbox.com/s/zbogg3vag5at98b/i18n-locale-leak.mov?dl=0
