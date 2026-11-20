FROM ruby:3.1.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .


ARG FLAG_B64
RUN sh -c 'printf %s "$FLAG_B64" | base64 -d > /app/flag.txt && chmod 644 /app/flag.txt'

EXPOSE 4567
CMD ["ruby", "app.rb"]
