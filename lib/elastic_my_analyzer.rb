module ElasticMyAnalyzer
  ES_SETTING = {
    analysis: {
      filter: {
        mynGram: {
          type: 'ngram',
          min_gram: 1,
          max_gram: 2
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