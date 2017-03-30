Package.describe({
  name: 'pangolinrex:material-effects',
  version: '0.0.1',
  summary: 'a set of material design components and effects for meteor',
  git: 'https://github.com/hartreed/custom-console.git',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.4.0.1');
  api.use([
    'coffeescript',
    'templating',
    'reactive-var',
    'mquandalle:jade@0.4.9',
    'mquandalle:stylus'
  ], 'client');
  api.addFiles([
    'mixins/util.styl'
  ], 'client', {isImport: true});
  api.addFiles([
    'classes/Module.coffee',
    'classes/Ripple.coffee',
    'components/materialButton/materialButton.tpl.jade',
    'components/materialButton/materialButton.styl',
    'components/materialButton/materialButton.coffee'
  ], 'client');
});

Package.onTest(function(api) {
  api.use('ecmascript');
  api.use('tinytest');
  try {
    api.mainModule('material-effects-tests.js');
  } catch (error) {}
});
