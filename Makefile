include .env.development

DART_DEFINE:=--dart-define SENTRY_DSN=${SENTRY_DSN}

.PHONY: devices
run-%:
	fvm flutter devices

.PHONY: run
run-%:
	fvm flutter run $(DART_DEFINE) --dart-define FLAVOR=dev -d ${@:run-%=%}

.PHONY: build
build-%:
	fvm flutter build ${@:build-%=%} ${DART_DEFINE} --dart-define FLAVOR=prod

build-android:
	fvm flutter build appbundle ${DART_DEFINE} --dart-define FLAVOR=prod --debug

build-ios:
	fvm flutter build ipa ${DART_DEFINE} --dart-define FLAVOR=prod

pub-build:
	fvm flutter pub run build_runner build
	
pub-get:
	fvm flutter pub get

clean:
	fvm flutter clean

.PHONY: build_runner
build_runner:
	fvm flutter pub run build_runner watch