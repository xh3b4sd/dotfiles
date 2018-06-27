package updater

import (
	"context"

	clientsearcher "github.com/giantswarm/clusterclient/service/release/searcher"
	"github.com/giantswarm/microerror"
)

func (s *Service) defaults(ctx context.Context, request Request) (Request, error) {
	if request.Cluster.Patch.ReleaseVersion != "" {
		clientRequest := clientsearcher.Request{
			ReleaseVersion: request.Cluster.Patch.ReleaseVersion,
		}

		clientResponse, err := s.ClusterClient.Release.Searcher.Search(ctx, clientRequest)
		if clientsearcher.IsNotFound(err) {
			return Request{}, microerror.Maskf(invalidRequestError, "release version '%s' does not exist", request.Cluster.Patch.ReleaseVersion)
		} else if err != nil {
			return Request{}, microerror.Mask(err)
		}

		request.Cluster.Release.Active = clientResponse.Active
		request.Cluster.Patch.ReleaseVersion = clientResponse.ReleaseVersion
		request.Cluster.Patch.VersionBundles = clientResponse.VersionBundles

	}

	return request, nil
}
