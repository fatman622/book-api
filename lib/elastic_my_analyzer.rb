module ElasticMyAnalyzer
  ES_SETTING = {
    analysis: {
      filter: {
        mynGram: {
          type: 'ngram',
          min_gram: 4,
          max_gram: 8
        }
      },
      analyzer: {
        my_analyzer: {
          type: 'custom',
          tokenizer: 'standard',
          filter: [
            'mynGram'
          ]
        }
      }
    }
  }
end