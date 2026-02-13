module.exports = {
  __esModule: true,
  default: {
    name: 'GraphQLUpload',
    description: 'Mock Upload Scalar',
    serialize: (v) => v,
    parseValue: (v) => v,
    parseLiteral: (v) => v,
  },
};