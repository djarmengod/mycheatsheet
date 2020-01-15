FROM openjdk:8-jdk

# Just matched `app/build.gradle`
ENV ANDROID_COMPILE_SDK "26"
# Just matched `app/build.gradle`
ENV ANDROID_BUILD_TOOLS "28.0.3"
# Version from https://developer.android.com/studio/releases/sdk-tools
ENV ANDROID_SDK_TOOLS "24.4.1"

ENV ANDROID_HOME /android-sdk-linux
ENV PATH="${PATH}:/android-sdk-linux/platform-tools/:/root/.rbenv/bin:/root/.rbenv/shims"

# install OS packages
RUN apt-get --quiet update --yes && apt upgrade
RUN apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1 build-essential
# We use this for xxd hex->binary
RUN apt-get --quiet install --yes vim-common

# Install 2.5.x version of Ruby
RUN apt install -y build-essential libssl-dev libreadline-dev zlib1g-dev
RUN wget -q https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer -O- | bash
RUN rbenv install 2.5.1 && rbenv global 2.5.1

# install Android SDK
RUN wget --quiet --output-document=android-sdk.tgz https://dl.google.com/android/android-sdk_r${ANDROID_SDK_TOOLS}-linux.tgz
RUN tar --extract --gzip --file=android-sdk.tgz
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-${ANDROID_COMPILE_SDK}
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-${ANDROID_BUILD_TOOLS}
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services
RUN echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository
# install Fastlane
COPY Gemfile.lock .
COPY Gemfile .
RUN gem install bundle
RUN bundle install
