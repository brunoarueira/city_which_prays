# | base
FROM ruby:3.2.2-alpine3.16 as base
RUN apk add --update --no-cache tzdata postgresql-dev postgresql-client build-base git shared-mime-info nodejs gcompat

ENV TZ=America/Sao_Paulo
ENV APP_NAME city_which_prays
ENV RAILS_ROOT /srv/www/${APP_NAME}
RUN mkdir -p $RAILS_ROOT

# | bundle
FROM base as bundle
ARG BUNDLE_WITHOUT_GROUPS
ARG BUNDLE_IS_PRD
COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle config set deployment ${BUNDLE_IS_PRD} && \
    bundle install --jobs 4

# | main
FROM base as main
ARG RELEASE
ENV RELEASE ${RELEASE}
COPY --from=bundle /tmp/vendor ${RAILS_ROOT}/vendor
COPY --from=bundle /usr/local/bundle/config /usr/local/bundle/config
WORKDIR ${RAILS_ROOT}
COPY . .

# | bundle-assets
FROM main as bundle-assets
RUN --mount=type=cache,target=${RAILS_ROOT}/tmp bundle exec rake assets:precompile

# | backend
FROM main as backend
COPY --from=bundle-assets /srv/www/${APP_NAME}/public ${RAILS_ROOT}/public
CMD bundle exec puma -C config/puma.rb

# | frontend
FROM nginx:stable-alpine as frontend
RUN apk add --update --no-cache apache2-utils
ENV APP_NAME city_which_prays
ENV FRONTEND_ROOT /var/www/${APP_NAME}
WORKDIR ${FRONTEND_ROOT}
COPY --from=bundle-assets /srv/www/${APP_NAME}/public ${FRONTEND_ROOT}/public
COPY ./infrastructure/docker/default.conf /tmp/docker.nginx
RUN envsubst '$FRONTEND_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
