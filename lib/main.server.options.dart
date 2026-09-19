// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:associate_site/components/contact_cta.dart' as _contact_cta;
import 'package:associate_site/components/emergency_notice.dart'
    as _emergency_notice;
import 'package:associate_site/components/footer.dart' as _footer;
import 'package:associate_site/components/grid_backdrop.dart' as _grid_backdrop;
import 'package:associate_site/components/header.dart' as _header;
import 'package:associate_site/components/hero.dart' as _hero;
import 'package:associate_site/components/hero_slideshow.dart'
    as _hero_slideshow;
import 'package:associate_site/components/info_list.dart' as _info_list;
import 'package:associate_site/components/link_card.dart' as _link_card;
import 'package:associate_site/components/notice_row.dart' as _notice_row;
import 'package:associate_site/components/section.dart' as _section;
import 'package:associate_site/pages/not_found_page.dart' as _not_found_page;
import 'package:associate_site/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {_header.Header: ClientTarget<_header.Header>('header')},
  styles: () => [
    ..._contact_cta.ContactCta.styles,
    ..._emergency_notice.EmergencyNoticeBanner.styles,
    ..._footer.Footer.styles,
    ..._grid_backdrop.GridBackdrop.styles,
    ..._header.HeaderState.styles,
    ..._hero.Hero.styles,
    ..._hero_slideshow.HeroSlideshow.styles,
    ..._info_list.InfoList.styles,
    ..._link_card.DocLink.styles,
    ..._link_card.LinkCard.styles,
    ..._link_card.LinkCardGrid.styles,
    ..._link_card.SocialLink.styles,
    ..._notice_row.NoticeRow.styles,
    ..._section.Section.styles,
    ..._not_found_page.NotFoundPage.styles,
    ..._app.App.styles,
  ],
);
