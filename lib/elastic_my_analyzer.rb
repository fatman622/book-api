module ElasticMyAnalyzer
  ES_SETTING = {
    index: {
      number_of_shards: 1
    },
    analysis: {
      filter: {
        mynGram: {
          type: 'ngram',
          min_gram: 1,
          max_gram: 4
        }
      },
      analyzer: {
        my_analyzer: {
          type: 'custom',
          tokenizer: 'standard',
          filter: [
            'lowercase', 'mynGram'
          ]
        }
      }
    }
  }
end