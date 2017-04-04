module ElasticMyAnalyzer
  ES_SETTING = {
    analysis: {
      filter: {
        my_stopwords: {
          type: 'stop',
          stopwords: ['and, is, the']
        },
        mynGram: {
          type: 'ngram',
          min_gram: 1,
          max_gram: 3
        }
      },
      analyzer: {
        my_analyzer: {
          type: 'custom',
          tokenizer: 'standard',
          filter: [
            'lowercase','mynGram','my_stopwords'
          ]
        }
      }
    }
  }
end