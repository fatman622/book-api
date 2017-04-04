module ElasticMyAnalyzer
  ES_SETTING = {
    analysis: {
      filter: {
        mynGram: {
          type: 'ngram',
          min_gram: 3,
          max_gram: 4
        }
      },
      analyzer: {
        my_analyzer: {
          type: 'custom',
          tokenizer: 'standard',
          filter: [
            'lowercase','mynGram'
          ]
        }
      }
    }
  }
end